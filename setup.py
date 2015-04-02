# -*- coding: utf-8 -*-
"""`sphinx_3dr_theme` lives on `Github`_.

.. _github: https://www.github.com/3drobotics/sphinx_3dr_theme

"""
from setuptools import setup, find_packages
from codecs import open
from os import path
from sphinx_3dr_theme import __version__

here = path.abspath(path.dirname(__file__))

setup(
		name='sphinx-3dr-theme',
		version=__version__,
		url='https://github.com/3drobotics/sphinx_3dr_theme/',
		license='MIT',
		author='3D Robotics',
		author_email='droneapi@3drobotics.com',
		description='3D Robotics official Sphinx theme.',
		long_description=open('README.md').read(),
		zip_safe=False,
		packages=['sphinx_3dr_theme'],
		package_data={'sphinx_3dr_theme': [
			'*.*',
			'theme.conf',
			'static/css/*.*',
			'static/fonts/*.*',
			'static/images/*.*',
			'static/js/*.*',
		]},
		install_requires=['sphinx >= 1.1'],
		classifiers=[
			'Development Status :: 3 - Alpha',
			'License :: OSI Approved :: BSD License',
			'Environment :: Console',
			'Environment :: Web Environment',
			'Intended Audience :: Developers',
			'Programming Language :: Python :: 2.7',
			'Programming Language :: Python :: 3',
			'Operating System :: OS Independent',
			'Topic :: Documentation',
			'Topic :: Software Development :: Documentation',
			],
		)

