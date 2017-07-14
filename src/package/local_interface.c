/*
 *  local_interface.c
 *
 *  Code for php localhost interface.
 *
 *  Copyright (C) 2017 Ciao Development Team
 */

#include <stdio.h> 
#include <stdlib.h> 
#include <string.h> 
#include <fcntl.h>

#include <ciao/ciao_prolog.h>


CBOOL__PROTO(open_html_file_c) {

  char* path;

  // Check if the argument is a valid string otherwise fails
  DEREF(X(0),X(0));
  if (IsAtom(X(0))) {
    path = (char *)TagToAtom(X(0))->name;
  }
  else {
    printf("First argument it is not instanciated\n"); 
    return FALSE;
  }

  // The length of the call depend on the paht's length
  int l = strlen(path);
  char call[l + 5];

  // Prepare the call to open the html file
  // TODO: in Windows / Linux open is not valid
  sprintf(call, "open %s", path);

  // It opens the file
  system(call);

  return TRUE;
}



CBOOL__PROTO(open_php_localhost_c) {

  int port;
  char call[30];
  pid_t pid;

  // Check if the argument is a valid number otherwise fails
  DEREF(X(0),X(0));
  if (IsInteger(X(0))) {
    port = (int)GetInteger(X(0));
  }
  else {
    printf("First argument it is not instanciated as an integer\n"); 
    return FALSE;
  }


  // Create a new process to hide the server messages
  pid = fork();
  
  if (pid == 0) { // Child

    int dev_null1 = open("/dev/null", O_WRONLY);
    int dev_null2 = open("/dev/null", O_WRONLY);

    dup2(dev_null1, fileno(stdout));
    dup2(dev_null2, fileno(stderr));

    // Kill previous localhost server
    sprintf(call,"lsof -ti :%d | xargs kill -SIGINT", port);
    system(call);
    
    // Prepare the call to open the localhost
    // TODO: Check if in Windows / Linux php works
    sprintf(call, "php -S localhost:%d  ", port);
    // The child process starts the server
    system(call);

    close(dev_null1);
    close(dev_null2);

    return FALSE;
  }
  else { // Parent

    // The parent continues with the execution
    printf(" Server - starts at http://localhost:%d/\n", port);

  }
  
  return TRUE;
}
