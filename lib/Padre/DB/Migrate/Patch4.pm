package Padre::DB::Migrate::Patch4;

use strict;
use Padre::DB::Migrate::Patch ();

our $VERSION = '0.85';
our @ISA     = 'Padre::DB::Migrate::Patch';





######################################################################
# Migrate Forwards

sub upgrade {
	my $self = shift;

	# Create the bookmark table
	$self->do(<<'END_SQL');
CREATE TABLE bookmark (
	id   INTEGER NOT NULL PRIMARY KEY,
	name VARCHAR(255) UNIQUE NOT NULL,
	file VARCHAR(255) NOT NULL,
	line INTEGER NOT NULL
)
END_SQL

	return 1;
}

1;