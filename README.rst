##################
django CMS Preview
##################


Dockerfile for a `django CMS <github.com/divio/django-cms>`_ preview (develop).


Get Started
===========

* `docker pull divio/django-cms-preview` (to pull)
* `docker run -d --name="djangocms-preview" -p 80:80 divio/django-cms-preview` (to run)


Credentials
===========

* Login: **user**
* Password: **password**


Other
=====

* Create fixtures: `python manage.py dumpdata > initial_data.json`
