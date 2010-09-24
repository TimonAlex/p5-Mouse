#!/usr/bin/perl
# This is automatically generated by author/import-moose-test.pl.
# DO NOT EDIT THIS FILE. ANY CHANGES WILL BE LOST!!!
use t::lib::MooseCompat;

use strict;
use warnings;

use Test::More;
$TODO = q{Mouse is not yet completed};
use Test::Mouse qw(does_ok);

BEGIN {
    package Foo::Meta::Role;
    use Mouse::Role;
    Mouse::Util::meta_class_alias
        FooRole => 'Foo::Meta::Role';

    package Foo::Meta::Class;
    use Mouse;
    extends 'Mouse::Meta::Class';
    with 'Foo::Meta::Role';
    Mouse::Util::meta_class_alias
        FooClass => 'Foo::Meta::Class';

    package Foo::Meta::Role::Attribute;
    use Mouse::Role;
    Mouse::Util::meta_attribute_alias
        FooAttrRole => 'Foo::Meta::Role::Attribute';

    package Foo::Meta::Attribute;
    use Mouse;
    extends 'Mouse::Meta::Attribute';
    with 'Foo::Meta::Role::Attribute';
    Mouse::Util::meta_attribute_alias
        FooAttrClass => 'Foo::Meta::Attribute';

    package Bar::Meta::Role;
    use Mouse::Role;
    Mouse::Util::meta_class_alias 'BarRole';

    package Bar::Meta::Class;
    use Mouse;
    extends 'Mouse::Meta::Class';
    with 'Bar::Meta::Role';
    Mouse::Util::meta_class_alias 'BarClass';

    package Bar::Meta::Role::Attribute;
    use Mouse::Role;
    Mouse::Util::meta_attribute_alias 'BarAttrRole';

    package Bar::Meta::Attribute;
    use Mouse;
    extends 'Mouse::Meta::Attribute';
    with 'Bar::Meta::Role::Attribute';
    Mouse::Util::meta_attribute_alias 'BarAttrClass';
}

package FooWithMetaClass;
use Mouse -metaclass => 'FooClass';

has bar => (
    metaclass => 'FooAttrClass',
    is        => 'ro',
);


package FooWithMetaTrait;
use Mouse -traits => 'FooRole';

has bar => (
    traits => [qw(FooAttrRole)],
    is     => 'ro',
);

package BarWithMetaClass;
use Mouse -metaclass => 'BarClass';

has bar => (
    metaclass => 'BarAttrClass',
    is        => 'ro',
);


package BarWithMetaTrait;
use Mouse -traits => 'BarRole';

has bar => (
    traits => [qw(BarAttrRole)],
    is     => 'ro',
);

package main;
my $fwmc_meta = FooWithMetaClass->meta;
my $fwmt_meta = FooWithMetaTrait->meta;
isa_ok($fwmc_meta, 'Foo::Meta::Class');
isa_ok($fwmc_meta->get_attribute('bar'), 'Foo::Meta::Attribute');
does_ok($fwmt_meta, 'Foo::Meta::Role');
does_ok($fwmt_meta->get_attribute('bar'), 'Foo::Meta::Role::Attribute');

my $bwmc_meta = BarWithMetaClass->meta;
my $bwmt_meta = BarWithMetaTrait->meta;
isa_ok($bwmc_meta, 'Bar::Meta::Class');
isa_ok($bwmc_meta->get_attribute('bar'), 'Bar::Meta::Attribute');
does_ok($bwmt_meta, 'Bar::Meta::Role');
does_ok($bwmt_meta->get_attribute('bar'), 'Bar::Meta::Role::Attribute');

done_testing;
