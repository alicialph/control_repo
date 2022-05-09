class minecraft {
	$url = 'https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar',
	$java_url = 'https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm',
  	$install_dir = '/opt/minecraft'
}{
  	file {'/opt/minecraft':
    		ensure => directory,
  	}
 	file {"${install_dir}/minecraft_server.jar":
    		ensure => file,
    		source => $url,
	}
  	package {'java':
		provider => 'rpm',
    		ensure => present,
		source => $java_url,
  	}
  	file {"${install_dir}/eula.txt":
    		ensure => file,
    		content => 'eula=true',
  	}
  	file {'/etc/systemd/system/minecraft.service':
    		ensure => file,
    		source => 'puppet:///modules/minecraft/minecraft.service',
  	}
  	service {'minecraft':
		ensure => running,
		enable => true,
  	}
}
