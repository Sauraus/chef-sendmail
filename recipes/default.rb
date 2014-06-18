unless node['sendmail']['ipv4'] || node['sendmail']['ipv6']
  Chef::Log.error ("You must set ['sendmail']['ipv4'] or ['sendmail']['ipv6'] to true, default for\
 ['sendmail']['ipv4'] is true your system overriding this!!!")
  return
end

package 'sendmail' do
	action :install
end

package 'sendmail-cf' do
  action :install
end

template '/etc/mail/sendmail.mc' do
  source 'sendmail.mc.erb'
  notifies :run, 'execute[make sendmail]', :immediately
end

execute 'make sendmail' do
  command '/etc/mail/make'
  action :nothing
  notifies :restart, 'service[sendmail]', :immediately
end

service 'sendmail' do
  action [ :enable, :start ]
end
