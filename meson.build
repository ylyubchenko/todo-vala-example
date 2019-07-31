project('todo', ['c', 'vala'], 
        version: '0.1.0',
  meson_version: '>= 0.40.0',
)

i18n = import('i18n')
gnome = import('gnome')

meson.add_install_script('build-aux/meson/postinstall.py')

subdir('data')
subdir('src')
subdir('po')
