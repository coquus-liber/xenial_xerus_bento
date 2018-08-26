
directory "/root/.gnupg" do
  recursive true
  mode '0700'
end

cookbook_file "/root/.gnupg/dirmngr.conf" do
  source "dirmngr.conf"
end

