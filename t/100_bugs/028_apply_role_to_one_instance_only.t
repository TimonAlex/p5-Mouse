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
    package MyRole1;
    use Mouse::Role;

    sub a_role_method { 'foo' }
}

{
    package MyRole2;
    use Mouse::Role;
    # empty
}

{
    package Foo;
    use Mouse;
}

my $instance_with_role1 = Foo->new;
MyRole1->meta->apply($instance_with_role1);

my $instance_with_role2 = Foo->new;
MyRole2->meta->apply($instance_with_role2);

ok ((not $instance_with_role2->does('MyRole1')),
    'instance does not have the wrong role');

ok ((not $instance_with_role2->can('a_role_method')),
    'instance does not have methods from the wrong role');

ok (($instance_with_role1->does('MyRole1')),
    'role was applied to the correct instance');

lives_and {
    is $instance_with_role1->a_role_method, 'foo'
} 'instance has correct role method';

done_testing;
