class tron-env {
  user {'tron':
    ensure => present,
    groups => ['adm', 'sudo'],
    managehome => true,
  }

  file {'.vimrc':
    path => '/home/tron/.vimrc',
    owner => 'tron',
    group => 'tron',
    ensure => present,
    source => 'puppet:///modules/tron_env/vimrc',
    require => User['tron']
  }

  file {'.gitconfig':
    path => '/home/tron/.gitconfig',
    owner => 'tron',
    group => 'tron',
    ensure => present,
    source => 'puppet:///modules/tron_env/gitconfig',
    require => User['tron']
  }

  file {'.bashrc.d':
    path => '/home/tron/.bashrc.d',
    owner => 'tron',
    group => 'tron',
    ensure => directory,
    require => User['tron']
  }

  file {'.bashrc':
    path => '/home/tron/.bashrc',
    owner => 'tron',
    group => 'tron',
    ensure => present,
    mode => '644',
    source => 'puppet:///modules/tron_env/bashrc',
    require => User['tron']
  }

  file {'1-inve_context':
    path => '/home/tron/.bashrc.d/1-inve_context',
    owner => 'tron',
    group => 'tron',
    ensure => present,
    source => 'puppet:///modules/tron_env/1-inve_context',
    require => File['.bashrc.d']
  }

  file {'0-bashrc':
    path => '/home/tron/.bashrc.d/0-bashrc',
    owner => 'tron',
    group => 'tron',
    ensure => present,
    source => 'file:///etc/bash.bashrc'
  }
}
