#!/usr/bin/perl
use Digest::SHA qw(sha256_hex);

#read the password hash
$passwordHash = "04e77bf8f95cb3e1a36a59d1e93857c411930db646b46c218a0352e432023cf2";

#open the wordlist
open(WORDLIST, "wordlist.txt");

while(<WORDLIST>) {

    chomp;
    $word = $_;

    $wordlistHash = sha256_hex($word);

    if($wordlistHash eq $passwordHash) {
        print("Password has been cracked! It was $word\n");
        exit;
    }

}

close(WORDLIST);