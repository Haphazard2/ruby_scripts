#!/usr/bin/ruby

require 'fileutils'
#
## Data
#
#An array of hashes
userlist = [ 
	{
		:user => "ppacheco",
		:uid => 1025,
		:gecos => "Phillip Pacheco", 
		:gid => 10, 
		:shell => "/bin/bash", 
		:pub_key => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+Pl+YgxMkyv6MgPX0k6Ea6QMb6MokYLnhX3qok9B4lZjZBCMUQqZURss2f4C1kookCBTNNOfsikZW99Epfz5hPFqgLvoKpkzFub+uRIKsmMRbz8kHzYwlihzRnb7cxwCgnX/lWbgsadFSbmGPUmEsBC84z6etihXIh2ZSSD5Uy1O2wixwQlhiwtm/tFWEVcIj7Pi0NvB4rmuCwlmdrS5kbFw7jTIbzFYnZLBwxpoSG5QpDR9Fu9+5V7VQFldUObXYTVGWAafT2HMKEFecPi2IPMC1yY7/le7DzOCzn0pmpJpOYgK1Snxs9B7HXcZ3it3vGgOgyh0HovpsAtjRELxn ppacheco@mb-ppacheco" },
]

#
## Functions
#
def account_creation( user, uid, gecos, gid, shell )
	puts "creating account for #{user}"
	system("useradd -b /home -c #{gecos} -u #{uid} -g #{gid} -s #{shell} #{user}")
end

def account_check(id)
	puts "executing account_check"
	system("id #{id}")
	status = $?.exitstatus
end

def ssh_setup(user, uid, gid, pub_key)
	puts "executing ssh_setup"
	ssh_dir = "/home/#{user}/.ssh"
	#
	Dir.mkdir("#{ssh_dir}", 0700)
	File.open("#{ssh_dir}/authorized_keys", mode="w", 0600) << pub_key
	FileUtils.cp_r("/tmp/config", "#{ssh_dir}/config")
	FileUtils.chown_R( uid, gid, "#{ssh_dir}")
end
#
## Main
#
puts "starting main"
last = userlist.count - 1
(0..last).each do |n|
	user = userlist[n][:user]
	uid = userlist[n][:uid]
	gecos = userlist[n][:gecos]
	gid = userlist[n][:gid]
	shell = userlist[n][:shell]
	pub_key = userlist[n][:pub_key]
	#
	if account_check(user) == true
		#Prevent overwriting of existing account.
		puts "account for #{user} already exists"
	else
		account_creation( user, uid, gecos, gid, shell)
		ssh_setup( user, uid, gid, pub_key)
	end
end
