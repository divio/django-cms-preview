FROM python:2.7

ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 1
ENV PIP_REQUIRE_VIRTUALENV false

RUN pip install --no-deps argparse djangocms-installer six dj-database-url pytz tzlocal

RUN apt-get -y update && apt-get -y install git
# TODO: use the `preview` branch once djangocms-installer supports that
RUN djangocms -q -p /cms -v develop preview

EXPOSE 80

WORKDIR /cms
CMD python manage.py runserver 0.0.0.0:80
