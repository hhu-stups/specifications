# A Collection of Formal Specifications

## Rationale

Many formal methods research communities
do not share a common benchmark set.
Working towards a shared repository of specifications
will improve several shortcomings currently present in academia:

- Benchmarks used in research papers often are not made permanent
  or are stored on webservers that move or delete shortly (after a few years) thereafter.
- Approaches using machine learning require a large data set.
  More available specifications simply means more data for them.
- Examples used in education can be shared.
- By adding meta-information, one can identify suitable benchmarks
  for a new technique more easily.

## Meta-Information

Meta-information is stored separately from the specification.
The exact format is work-in-progress.
The idea is that a small amount of data should be mandatory,
and that it must be extensible with optional data
that may be specific to a technique regarding model checking, predicate solving, etc.
The scripts folder contains a few utilities to read and process the meta-information.

## Contributions

Contributions are explicitly welcome.
The initial data in this repository is our collection of examples used for ProB.
This repository is not limited to specifications written in the B family:
we already include specifications written in CSP, Z, TLA+, and so on.
We accept pull requests containing additional specifications,
as long as proper meta-information is included.

## Updates

Once submitted, specifications shall not be deleted or modified.
Updated versions can be submitted and stored in new files / directories.
Comments in the meta-information can explain differences and relationships
between several versions.

## Article

The shared repository is described in this [ABZ'2020 article](https://rdcu.be/b4rpD).

## Acknowledgements

We like to thank everyone who contributed to this repository.
Our initial set of specifications contains examples from:

- Jean-Raymond Abrial
- Yamine Ait-Ameur
- Guillaume Babin
- David Basin
- Nicolas Beauger
- Jens Bendisposto
- Karim Berkani
- Christian Boland
- Joachim Breitner
- Lilian Burdy
- Jerôme Burlando
- Michael Butler
- Nestor Catano
- John Colley
- John Derrick
- Ivaylo Dobrikov
- Carla Ferreira
- Tomas Fischer
- Benoît Fraikin
- Marc Frappier
- Vlad Gheorghe
- Francois Guiziou
- Dominik Hansen
- Stefan Hallerstede
- Akram Idani
- Alexei Iliasov
- Andrew Ireland
- Michael Jastram
- Sebastian Krings
- Lukas Ladenberger
- Thierry Lecomte
- Yves Ledru
- Stéphane Lo-Presti
- Ammel Mammar
- Atif Mashkoor
- Thierry Massart
- Valerio Medeiros Jr
- Luis-Fernando Mejia
- David Mentré
- Stephan Merz
- Atif Mashkoor
- Marcel Oliveira
- Ian Oliver
- Daniel Plagge
- Theophile Prevost
- Klaus Reichl
- Maria LLano Rodriguez
- Manoranjan Satpathy
- Malte Schmidt
- David Schneider
- Steve Schneider
- Colin Snook
- Corinna Spermann
- Prateek Srivastava
- Nicolas Stouls
- Helen Treharne
- Harald Wiegard
- Jim Woodcock

