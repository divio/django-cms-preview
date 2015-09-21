FROM python:2.7

ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 1
ENV PIP_REQUIRE_VIRTUALENV false

RUN pip install --no-deps argparse djangocms-installer six dj-database-url pytz tzlocal

RUN apt-get -y update && apt-get -y install git
ADD requirements.txt /requirements.txt
RUN djangocms -r /requirements.txt -q -p /cms preview

RUN pip install https://github.com/divio/djangocms-admin-style/archive/develop.zip

ADD create-users /cms/create-users
RUN chmod +x /cms/create-users

EXPOSE 80

WORKDIR /cms
RUN /cms/create-users
ADD settings.py /cms/preview/settings.py
ADD template.html /cms/preview/templates/aldryn_faq/plugins/category_list.html
ADD template.html /cms/preview/templates/aldryn_faq/plugins/latest_questions.html
ADD template.html /cms/preview/templates/aldryn_faq/plugins/question_list.html
ADD template.html /cms/preview/templates/aldryn_faq/plugins/top_questions.html
ADD template.html /cms/preview/templates/aldryn_faq/plugins/most_read_questions.html
ADD template.html /cms/preview/templates/aldryn_jobs/plugins/categories_list.html
ADD template.html /cms/preview/templates/aldryn_jobs/plugins/latest_entries.html
ADD template.html /cms/preview/templates/aldryn_people/plugins/standard/people_list.html

RUN python manage.py syncdb --noinput
RUN python manage.py migrate

ADD initial_data.yaml /cms/initial_data.yaml
RUN python manage.py loaddata /cms/initial_data.yaml

CMD python manage.py runserver 0.0.0.0:80
