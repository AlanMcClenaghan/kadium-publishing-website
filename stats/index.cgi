#!/usr/bin/perl -w
use strict;
use BSD::Resource;
setrlimit(RLIMIT_AS, 128000000, 1280000000);
setrlimit(RLIMIT_CPU, 120, 120);
use CGI;
use Cwd 'getcwd';
use IO::Handle;
STDOUT->autoflush(1);
my $cwd=getcwd();
my $root_path;
if($cwd=~m#^(/home/(?:sites|cluster-sites/\d+)/[\w\.\-]+/)#) {
	$root_path=$1;
} else {
	die
}

my $cgi=new CGI;
%ENV=(PATH=>'/bin:/usr/bin:/usr/local/bin', HTTP_HOST=>$ENV{HTTP_HOST});
my $pid=open(CHILD, "-|");
die unless defined $pid;
if(!$pid) {
	# child
	system("./awstats.pl","-config=kadiumpublishing.com", "-update");
	exit 0;
}
local $/=undef;
my $data=<CHILD>;
close CHILD;
if($data) {
	print STDERR $data;
}
print $cgi->redirect("awstats.pl");
