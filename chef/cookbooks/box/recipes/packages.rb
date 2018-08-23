
box = node[:box] 

box[:ppas].each_pair do |name, ppa|
  apt_repository name do
    uri ppa
    key_proxy "http://didit-proxy.uscis.dhs.gov:80"
  end
end

package box[:packages] do
  timeout 60 * 60 # 60 minutes
  # live_stream true
end


