class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDNg8MbCgMATupfva/2ToWGQt9CmNEAs1X782XAzK4igd8KR3JO7EcBdjQQe1jtJfBsEZIErf3jPecaokCLk9i/Fbl/HmYqJesH95EykwVRdbEgzQbUaLSToIbdBlTQDkrviiceeukWPqRCikiuG3J8mwsvtWP5axkJR8eWLYW75iQYbDFBfGdgLtrTMfaE03HBjQcNqmMAuKa1n/rZv7Y3P6Gwm2nu9ioxvdYk/aFmaN25tBpHY1Lvtnn7Pn2QLEUDlGLQE3PJoxloZFEn2FcOouRqk66/m0nfZlzVuqB80GokypSuZYwgyJsKC5VWWGWXu7UHsrEnpbXNzoHK1S03',
	}  
}
