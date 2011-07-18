package Padre::DB::Migrate::Patch8;

# Changes to support upgraded session support

use strict;
use Padre::DB::Migrate::Patch ();

our $VERSION = '0.85';
our @ISA     = 'Padre::DB::Migrate::Patch';





######################################################################
# Migrate Forwards

sub upgrade {
	my $self = shift;

	# Remove the session table created in migrate-5
	do(<<'END_SQL');
DROP TABLE session
END_SQL

	# Create the new session table
	do(<<'END_SQL');
CREATE TABLE session (
	id INTEGER NOT NULL PRIMARY KEY,
	name VARCHAR(255) UNIQUE NOT NULL,
	description VARCHAR(255),
	last_update DATE
)
END_SQL

	# Create the table containing the session files
	do(<<'END_SQL');
CREATE TABLE session_file (
	id INTEGER NOT NULL PRIMARY KEY,
	file VARCHAR(255) NOT NULL,
	position INTEGER NOT NULL,
	focus BOOLEAN NOT NULL,
	session INTEGER NOT NULL,
	FOREIGN KEY (session) REFERENCES session ( id )
)
END_SQL

	return 1;
}

1;