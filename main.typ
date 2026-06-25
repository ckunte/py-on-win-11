// This is the main file that relies on template.typ for
// settings; available from https://github.com/ckunte/note
// 2025 C Kunte
#import "inc/template.typ": *
#show: note.with(
  title: [Set python up in Windows 11],
//subtitle: [in Windows 11, macOS, and linux],
  author: "C Kunte",
  paper: "a5",
)

// powershell syntax highlighting enabled
#show raw.where(lang: "powershell"): set raw(syntaxes: "inc/PowerShell.sublime-syntax")
#show raw.where(lang: "ps1"): set raw(syntaxes: "inc/PowerShell.sublime-syntax")

// content from here-on

// TOC
#include("inc/toc.typ")

/*
= Summary

#lorem(50)

#pagebreak(weak: true)

*/
// consider setting heading numbers here-on
#set heading(numbering: "1.1")

= Introduction

There is more than one way to install python~@pyf on Windows 11. Written with an end-user in mind who is not a professional programmer, this brief note takes the best practice route using virtual environment, employing #link("https://github.com/astral-sh/uv")[uv], a package manager by Astral~@astral.

= Setup

The note covers (a) baseline setup that is app agnostic, works in a terminal, and (b) setup in apps enabling access to python from apps using baseline setup. For Windows 11, see @s_win and @a_win.

#include "inc/win11.typ"
#bibliography("inc/ref.yaml")
