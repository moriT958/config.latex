#!/usr/bin/env perl

# Output directory
$out_dir = './build';
$aux_dir = './build';

# LaTeX
$latex = "platex -synctex=1 -halt-on-error -file-line-error -output-directory=$out_dir %O %S";
$max_repeat = 5;

# BibTeX
$bibtex = "pbibtex -output-directory=$out_dir %O %S";
$biber = "biber --bblencoding=utf8 -u -U --output_safechars --output-directory=$out_dir %O %S";

# Index
$makeindex = "mendex -output-directory=$out_dir %O -o %D %S";

# DVI / PDF
$dvipdf = "dvipdfmx %O -o %D %S";
$pdf_mode = 3;

# Preview
$pvc_view_file_via_temporary = 0;
if ($^O eq 'linux') {
    $dvi_previewer = "xdg-open %S";
    $pdf_previewer = "xdg-open %S";
} elsif ($^O eq 'darwin') {
    $dvi_previewer = "open %S";
    $pdf_previewer = "open %S";
} else {
    $dvi_previewer = "start %S";
    $pdf_previewer = "start %S";
}

# Clean up
$clean_full_ext = "$out_dir/%R.synctex.gz";

