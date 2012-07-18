package Test::Routine::AutoClear;
{
  $Test::Routine::AutoClear::VERSION = '0.001'; # TRIAL
}
# ABSTRACT: Enables autoclearing attrs in Test::Routines
use Test::Routine ();
use Moose::Exporter;

Moose::Exporter->setup_import_methods(
    with_meta => [qw{has}],
    also => 'Test::Routine',
);

sub init_meta {
    my($class, %arg) = @_;

    my $meta = Moose::Role->init_meta(%arg);
    my $role = $arg{for_class};
    Moose::Util::apply_all_roles($role, 'Test::Routine::DoesAutoClear');

    return $meta;
}

sub has {
    my($meta, $name, %options) = @_;

    if (delete $options{autoclear}) {
        push @{$options{traits}}, 'AutoClear'
    }

    $meta->add_attribute(
        $name,
        %options,
    );
}
1;


=pod

=head1 NAME

Test::Routine::AutoClear - Enables autoclearing attrs in Test::Routines

=head1 VERSION

version 0.001

=head1 SYNOPSIS

    use Test::Routine::AutoClear;
    use Test::More;
    use File::Tempdir;

    has _tempdir => (
        is        => 'ro',
        isa       => 'Int',
        builder   => '_build_tempdir',
        lazy      => 1,
        autoclear => 1,
        handles   => {
            tempdir => 'name',
        },
    );

    sub _build_tempdir {
        File::Tempdir->new();
    }

And now all the tests that use a tempdir in your test routine will get a
fresh Tempdir

=head1 DESCRIPTION

When I'm writing tests with L<Test::Routine> I find myself writing code like
this all the time:

    has counter => (
        is      => ro,
        lazy    => 1,
        default => 0
        lazy    => 1,
        clearer => 'reset_counter',
    );

=head1 SEE ALSO

=over 4

=item *

L<Test::Routine>

=back

=head1 AUTHOR

Piers Cawley <pdcawley@bofh.org.uk>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Piers Cawley.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

