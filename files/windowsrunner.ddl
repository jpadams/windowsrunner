metadata :name        => "windowsrunner",
         :description => "Run arbitrary commands on a Windows machine",
         :author      => "Jeremy Adams (thanks to Andreas Zuber <zuber@puzzle.ch> for inspiration)",
         :license     => "Apache v2",
         :version     => "1.0.0",
         :url         => "www.puppetlabs.com",
         :timeout     => 15

action "run", :description => "Runs an arbitray command on Windows" do
  display :always

  input :command,
        :prompt      => "Command",
        :description => "(will be prefixed with cmd /c)",
        :type        => :string,
	:validation  => '^.+$',
        :optional    => false,
        :maxlength   => 255
 
  output :status,
         :description => "Status after attempt to execute run",
         :display_as  => "Service Status"

#  output :out,
#         :description => "No stdout currently on Windows",
#         :display_as  => "stdout",
#         :default     => "stdout unsupported"

  output :err,
         :description => "Error messages",
         :display_as  => "stderr"

end
