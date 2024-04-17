from distutils.core import setup
import py2exe
setup(
    name="Audio_Converter",
    version='2.1',
    description='Video to Audio Converter',
    author="Danish Khan",
    author_email="danishex07@gmail.com",
    windows = [{'script': "Converter.py" , 'icon_resources': [(0, 'Converter.ico')]}],
    zipfile = None,)
