use 5.006;
use inc::Module::Install;


name('Var');
version_from('Var.pm');
abstract_from("Var.pod");
author('xern <xern@cpan.org>');
license('perl');

requires('perl'             => 5.006);
requires('Test::More');
%req = qw(
	 Regexp::List    0.10
	 Compress::Zlib  1
	 Digest::HMAC_MD5 1
	 Digest::MD2      1
	 Digest::MD5 1
	 Digest::SHA1 1
	 Lingua::EN::Numbers 0.01
	 Lingua::ZH::Numbers 0.03
	 List::Util 1
	 String::Random 0.198
	 Statistics::Lite 1
	 Text::Bastardize 0.06
	 String::BitCount 1
	 String::CRC32    1
	  Spiffy           0.12
	  );

foreach $p (keys %req){
    requires($p => $req{$p});
}


check_nmake();      # check and download nmake.exe for Win32

&Makefile->write;

