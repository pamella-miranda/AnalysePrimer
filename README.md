# AnalysePrimer

AnalysePrimer is a software package to evaluate DNA mismatches in primers and probes used in PCR- and LAMP-based methods and other techniques.

Given a set of primers/probes and genomes of interest, you will be able to align them and achieve all possible alignments in a perfect and mismatch way. Then, it will calculate the melting temperatures and the coverages for perfect match and up to three contiguous mismatches.

### Note

A complete user manual is available here as analyseprimer-user-manual.pdf.

## Installation

### Download the software package

You can find the compiled binary files, for many Linux distributions, as well as source code, at this location:

https://bioinf.fisica.ufmg.br/software/

Browse to the desired version of the softwares and then download the appropriate packages for your Linux distribution. If your distribution is not covered then download the source code and compile manually, see below for instructions.

You need download and install the following software packages

1. TfReg (version 5.3 or higher)
2. AlignPrimer (version 1.0 or higher)
3. analyse mismatch primers.tar.gz

The latter is a package of Bash and Perl scripts to carry AnalysePrimer out, examples of primer files and its documentation.

### What will be installed?

Typically, there will be at least a binary executable file for TfReg and AlignPrimer

/usr/bin/tfreg
/usr/bin/align_primer

The documentation (which you are reading right now) is located at 

http://bioinf.fisica.ufmg.br/software/analyse_mismatch_primers.tar.gz

named analyseprimer-user-manual.pdf.

### Specific instructions

All packages were fully tested for OpenSUSE 15.0 and 15.1.

* TfReg and AlignPrimer

  Download the appropriate package for your system from

  https://bioinf.fisica.ufmg.br/software/

  For example, if your system is 64bits, you may download the packages

  http://bioinf.fisica.ufmg.br/software/tfreg-6.0/openSUSE_Leap_42.3/TfReg-1.0-1.2.1.x86_64.rpm
  http://bioinf.fisica.ufmg.br/software/AlignPrimer-1.0/openSUSE_Leap_42.3/AlignPrimer-1.0-4.1.x86_64.rpm

  Note: version numbers may vary from this example. Then install

  zypper install TfReg-1.0-1.2.1.x86_64.rpm
  zypper install AlignPrimer-1.0-4.1.x86_64.rpm

* analyse_mismatch_primers

  Download the source package from webpage

  http://bioinf.fisica.ufmg.br/software/analyse_mismatch_primers.tar.gz

  The package is called analyse_mismatch_primers.tar.gz. You need to create a new folder or put the package in the folder of your choice. 
  Unpacking the tar package

  tar -xvf analyse_mismatch_primers.tar.gz

The scripts and examples of primer files will be accessible.

### If things go wrong

Most problems will come from missing library packages or from erroneous usage of your system. It is not possible for me to cover everything that may go wrong, so please feel free to contact me. Please include a detailed description of error messages, which system you are using and a step by step description of what you tried to do. Please understand that I will need as much information as possible. I can do nothing with messages saying simply “TfReg is not working on Ubuntu”.

## Authors

Pâmella Miranda --- pamella.mm@gmail.com

Gerald Weber --- gweberbh@gmail.com

## Version History

* 0.1 --- initial release

## License

This project is licensed under the MIT License.
See the LICENSE.md file for details.

## Cite

* P. Miranda, G. Weber, Thermodynamic evaluation of the impact of DNA mismatches in PCR-type SARS-CoV-2 primers and probes, Mol. Cell. ProbesIn press. doi:10.1016/j.mcp.2021.101707.
* P. Miranda, V. B. Barbosa and G. Weber. Mesoscopic evaluation of DNA mismatches in PCR primer-target hybridisation to detect SARS-CoV-2 variants of concern. In Brazilian Symposium on Bioinformatics, pages 145–150. Springer, 2021. doi:10.1007/978-3-030-91814-9 15.
* P. Miranda, P. A. Alves, R. L. do Monte-Neto and G. Weber. In silico thermodynamic evaluation of the effectiveness of RT-LAMP primers SARS-CoV-2 variants detection. The Open COVID Journal, 4(1), 2024. doi:10.2174/0126669587279780240130063422.
