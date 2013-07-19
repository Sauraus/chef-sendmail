%w( sendmail sendmail-base sendmail-cf sendmail-doc ).each do |p|
	package p do
		action :remove
	end
end

service 'sendmail' do
	action [ :stop, :disable ]
end
