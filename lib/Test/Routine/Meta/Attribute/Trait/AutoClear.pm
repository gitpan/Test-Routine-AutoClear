package Test::Routine::Meta::Attribute::Trait::AutoClear;
{
  $Test::Routine::Meta::Attribute::Trait::AutoClear::VERSION = '0.002';
}
use Moose::Role;

package Moose::Meta::Attribute::Custom::Trait::AutoClear;
{
  $Moose::Meta::Attribute::Custom::Trait::AutoClear::VERSION = '0.002';
}
sub register_implementation {
    'Test::Routine::Meta::Attribute::Trait::AutoClear';
}

1;

__END__
=pod

=head1 NAME

Test::Routine::Meta::Attribute::Trait::AutoClear

=head1 VERSION

version 0.002

=head1 AUTHOR

Piers Cawley <pdcawley@bofh.org.uk>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Piers Cawley.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

