# Simply installs the Mcollective agent on the master and nodes.

class windowsrunner {

  if $::kernel == 'windows' {

    file { 'C:\ProgramData\PuppetLabs\mcollective\etc\plugins\mcollective\agent\windowsrunner.ddl':
      ensure => file,
      owner  => Administrator,
      group  => Administrators,
      mode   => '0644',
      source => 'puppet:///modules/windowsrunner/windowsrunner.ddl',
      notify => Service['pe-mcollective'],
    }

    file { 'C:\ProgramData\PuppetLabs\mcollective\etc\plugins\mcollective\agent\windowsrunner.rb':
      ensure => file,
      owner  => Administrator,
      group  => Administrators,
      mode   => '0644',
      source => 'puppet:///modules/windowsrunner/windowsrunner.rb',
      notify => Service['pe-mcollective'],
    }

  }

  # For the Puppet Enterprise Master server
  elsif $::kernel == 'Linux' {

    file { '/opt/puppet/libexec/mcollective/mcollective/agent/windowsrunner.ddl':
      ensure => file,
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/windowsrunner/windowsrunner.ddl',
      notify => Service['pe-mcollective'],
    }

    file { '/opt/puppet/libexec/mcollective/mcollective/agent/windowsrunner.rb':
      ensure => file,
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/windowsrunner/windowsrunner.rb',
      notify => Service['pe-mcollective'],
    }

  }

  else {

    notify { 'Windowsrunner only supported on Linux master and Windows agent nodes': }

  }

}
