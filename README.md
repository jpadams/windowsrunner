#windowsrunner


#### Table of Contents

1. [Overview](#overview)
2. [Setup](#setup)
3. [Usage](#usage)
4. [Notes](#notes)
5. [Credits](#credits)

### Overview
This puppet module installs a Mcollective agent called 'windowsrunner' which allows 
you to run an arbitrary command on Windows via Mcollective's 'mco' or Puppet Enterprise Live Management console.

It is intended for Puppet Enterprise and was developed on PE 3.1 running on a CentOS 6
master with Windows Server2008r2 nodes.

### Setup
To install the windowsrunner agent, simply classify your master and your windows nodes 
with the 'windowsrunner' class. Consider using a group in the PE Console.

### Usage
Commandline usage: 

    $ mco rpc windowsrunner run command="mkdir c:\foobar"

Live Management usage:

    Put your command (e.g. mkdir c:\foobar) in the 'Command' text field and press the red 'Run' button.
Your command will automatically be prefixed with ["cmd /c"](http://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/cmd.mspx?mfr=true) 

### Notes
This is NOT an agent that you will want to use in production since you can 
execute any arbitrary command on a Windows machine. 

That being said, it's a great example of what's possible: the ability to run commands
on hundreds or thousands of Widows nodes in parallel.

You can easily use this module to create your own module which executes a single action
by hardcoding the 'command' in the windowsrunner.rb file and removing the 'input' stanza from the windowsrunner.ddl.

You could also have a list of approved actions and validate input for a match before execution.

The name of this agent is really long as well, so you'll probably want something more
pithy to fit well in the PE LM console listing.

### Credits
Got inspiration for this from 'windowsrun' mco agent by Andreas Zuber <zuber@puzzle.ch>.
Unfortunately that code didn't work at all for me and had to do a complete rewrite. 

Thanks to everyone who pitched in, including the omnipresent James Sweeny.

Special thanks for the hours spent by Pieter Loubser, Richard Clamp, and Josh Cooper.

