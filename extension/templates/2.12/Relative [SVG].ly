\transpose %{OOoLilyPondCustom1%}c c%{OOoLilyPondEnd%}
\relative %{OOoLilyPondCustom2%}g,%{OOoLilyPondEnd%} {
%{OOoLilyPondCode%}% This templates lets you enter notes in relative mode.
% See the LilyPond documentation:
% http://lilypond.org/doc/stable/Documentation/notation/pitches
% The start pitch you can specify in the "Custom 2" field.

\key g \major
\clef bass
g8 a b g c a d d, | g2 \bar "|."%{OOoLilyPondEnd%}
}

% -------------------------------------------------------

#(set-global-staff-size %{OOoLilyPondStaffSize%}20%{OOoLilyPondEnd%})
#(define version-seen #t)  % don't remove, because
% the version warning has a slightly different format than normal error messages.
% This (still) would crash OLy's message handling...

\paper {
  #(define dump-extents #t)
  paper-width  = %{OOoLilyPondLineWidth%}17\cm%{OOoLilyPondEnd%}
  paper-height = 8\cm
  indent = #0
  short-indent = \indent
  ragged-right = ##t
  
  left-margin   = 0
  right-margin  = 0
  top-margin    = 0
  bottom-margin = 0
  print-page-number = ##f
  
  page-count = 1
  
  % If LilyPond's default fonts are not installed and therefore "invisible" to other applications, 
  % you can define a replacement font here:

  %{
  #(define fonts
     (make-pango-font-tree
      "TeXGyreSchola"           ; adjust this font name according to your needs
      "TeXGyreHeros"            ; adjust this font name according to your needs
      "TeXGyreCursor"           ; adjust this font name according to your needs
      (/ staff-height pt 20)))
  %}

  %{
  % if you only want to specify a "roman" font and leave "sans" and "typewriter" untouched:
  #(define fonts
     (make-pango-font-tree
      "Century Schoolbook L"	; adjust this font name according to your needs
      "sans-serif"              ; (remains unchanged)
      "monospace"               ; (remains unchanged)
      (/ staff-height pt 20)))
  %}

  %{
  % for LilyPond 2.19.12 and newer, you can alternatively use and modify this:
  #(define fonts
    (set-global-fonts
      #:music "emmentaler"
      #:brace "emmentaler"
      #:roman "Century Schoolbook L"	; adjust this font name according to your needs
      #:sans "sans-serif"               ; adjust this font name according to your needs
      #:typewriter "monospace"          ; adjust this font name according to your needs
      #:factor (/ staff-height pt 20)
  ))
  % taken from http://lilypondblog.org/2015/03/managing-alternative-fonts-with-lilypond/

  %}
}

\header {
  tagline = ##f
}

\layout {
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}

% %{OOoLilyPondCustom1Label%}Transpose:%{OOoLilyPondEnd%}
% %{OOoLilyPondCustom2Label%}\relative:%{OOoLilyPondEnd%}