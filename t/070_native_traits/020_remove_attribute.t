#!/usr/bin/perl
# This is automatically generated by author/import-moose-test.pl.
# DO NOT EDIT THIS FILE. ANY CHANGES WILL BE LOST!!!
use t::lib::MooseCompat;

use strict;
use warnings;

use Test::More;
$TODO = q{Mouse is not yet completed};
use Test::Exception;

{
    package MyHomePage;
    use Mouse;

    has 'counter' => (
        traits  => ['Counter'],
        is      => 'ro',
        isa     => 'Int',
        default => 0,
        handles => {
            inc_counter   => 'inc',
            dec_counter   => 'dec',
            reset_counter => 'reset',
        }
    );
}

my $page = MyHomePage->new();
isa_ok( $page, 'MyHomePage' );

can_ok( $page, $_ ) for qw[
    counter
    dec_counter
    inc_counter
    reset_counter
];

lives_ok {
    $page->meta->remove_attribute('counter');
}
'... removed the counter attribute okay';

ok( !$page->meta->has_attribute('counter'),
    '... no longer has the attribute' );

ok( !$page->can($_), "... our class no longer has the $_ method" ) for qw[
    counter
    dec_counter
    inc_counter
    reset_counter
];

done_testing;
