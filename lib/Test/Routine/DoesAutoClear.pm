package Test::Routine::DoesAutoClear;
{
  $Test::Routine::DoesAutoClear::VERSION = '0.002';
}
use Moose::Role;
require Test::Routine::Meta::Attribute::Trait::AutoClear;

after run_test => sub {
    my $self = shift;

    $_->clear_value($self) foreach grep {
        $_->does( 'Test::Routine::Meta::Attribute::Trait::AutoClear' )
    } $self->meta->get_all_attributes;
};

1;

__END__
=pod

=head1 NAME

Test::Routine::DoesAutoClear

=head1 VERSION

version 0.002

=head1 AUTHOR

Piers Cawley <pdcawley@bofh.org.uk>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Piers Cawley.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

