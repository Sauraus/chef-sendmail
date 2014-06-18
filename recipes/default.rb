package 'sendmail' do
	action :install
end


service 'sendmail' do
	action [ :enable, :start ]
end


template "/etc/mail/sendmail.cf" do
 	source    "sendmail.cf.erb"
 	notifies  :restart,"service[sendmail]"
end


# template "/etc/mail/relay-domains" do
# 	source "relay-domains"
# 	notifies :restart,"service[sendmail]"
# end