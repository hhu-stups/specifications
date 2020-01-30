\documentclass{article}
\usepackage{fuzz}
\begin{document}
\begin{zed}
  [Name]
\end{zed}

\begin{zed}
Tree ::= Child\ldata Name \rdata | Parent \ldata Name \cross \power Tree \rdata 
\end{zed}


\begin{schema}{System}
  x : Tree
\end{schema}

\begin{schema}{InitSystem}
  System' \\
\where
  x' \in Tree \\
\end{schema}

\begin{zed}
  Init \defs [~System' | InitSystem~] \\
\end{zed}
\end{document}