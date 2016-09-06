##################
django CMS Preview
##################


Dockerfile for a `django CMS <http://github.com/divio/django-cms>`_ preview (develop).


Get Started
===========

Build locally:

* ``docker build --no-cache -t django-cms-preview .``
* ``docker run -p 8000:80 -t django-cms-preview``

Build from docker hub:

* ``docker pull divio/django-cms-preview`` (to pull)
* ``docker run -d --name="djangocms-preview" -p 80:80 divio/django-cms-preview`` (to run)


Credentials
===========

* Login: **user**
* Password: **password**


Other
=====

* Create fixtures: ``python manage.py dumpdata > initial_data.json``
