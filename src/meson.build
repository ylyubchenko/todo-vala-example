vala_sources = [
  'main.vala',

  'widgets/form.vala',
  'widgets/list-item.vala',
  'widgets/list.vala',
  'window.vala',

  'models/todo.vala',

  'data/repository.vala',
  'data/todos-repository.vala',
  'data/unit-of-work.vala'
]

todo_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('libxml-2.0'),
  dependency('libgda-5.0')
]

executable('todo',
  vala_sources + resources,
  vala_args: [
    '--target-glib=2.50',
    '--vapidir',
    join_paths(meson.source_root(), 'vapi')
  ],
  dependencies: todo_deps,
  install: true,
)
