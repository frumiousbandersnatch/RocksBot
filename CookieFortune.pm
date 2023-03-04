package plugins::CookieFortune;
#---------------------------------------------------------------------------
#    Copyright (C) 2013  egretsareherons@gmail.com
#    https://github.com/egretsareherons/RocksBot
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#--
use strict;         
use warnings;
use base qw (modules::PluginBaseClass);
use modules::PluginBaseClass;
use Data::Dumper;
use URI::Escape;
use JSON;

sub getOutput {
    my $self = shift;
    my $cmd = $self->{command};
    my $output = "";
    my $url;
    my $term;

    $self->suppressNick(1);
    $url = "http://www.fortunecookiemessage.com/";
    my $feed  = XML::Feed->parse(URI->new($URL));
  
    return "Fortune Cookie: ".$j->{"cookie-link"};
}


sub listeners{
    my $self = shift;
    
    my @commands = [qw(cookie)];

    my @irc_events = [qw () ];

    my @preg_matches = [qw () ];

    my @preg_excludes = [ qw() ];

    my $default_permissions =[ ];

    return { commands=>@commands,
        permissions=>$default_permissions,
        irc_events=>@irc_events,
        preg_matches=>@preg_matches,
        preg_excludes=>@preg_excludes
    };

}

##
## addHelp()
##  The help system will pull from here using PluginBaseClass->help(key).
##
sub addHelp{
    my $self = shift;
    $self->addHelpItem("[plugin_description]", "Fortune Cookie Message.");
   $self->addHelpItem("[cookie]", "Usage: cookie");
}
1;
__END__
