todo_sources = [
  'main.vala',
  'window.vala',
]

todo_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('libxml-2.0'),
  dependency('libgda-5.0')
]

gnome = import('gnome')

todo_sources += gnome.compile_resources('todo-resources',
  'todo.gresource.xml',
  c_name: 'todo'
)

executable('todo', todo_sources,
  vala_args: '--target-glib=2.50',  dependencies: todo_deps,
  install: true,
)
