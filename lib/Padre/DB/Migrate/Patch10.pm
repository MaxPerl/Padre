package Padre::DB::Migrate::Patch10;

# Changes to the plugin system mean plugins are now tracked by class

use strict;
use Padre::DB::Migrate::Patch ();

our $VERSION = '0.85';
our @ISA     = 'Padre::DB::Migrate::Patch';





######################################################################
# Migrate Forwards

sub upgrade {
	my $self = shift;

	$self->do("UPDATE plugin SET name = 'Padre::Plugin::' || name");
	$self->do("DELETE FROM plugin WHERE name LIKE 'Padre::Plugin::%'");

	return 1;
}

1;
