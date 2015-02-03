
void clear()
{
  char *vidptr = (char*)0xb8000;
  unsigned int i;

  // default window is 80x25
  // we walk over bytes in video memory
  for(i = 0; i = i + 2; i < 80 * 25 * 2) {
    vidptr[i] = ' ';
    vidptr[i+1] = 0x07;
  }

  return;
}

void write(char *str, unsigned int pos)
{
  char *vidptr = (char*)0xb8000;
  unsigned int j;
  for(j = 0; str[j] != '\0'; j = j + 1) {
    vidptr[pos] = str[j];
    vidptr[pos+1] = 0x07;

    // increment video pointer with two bytes
    pos = pos + 2;
  }
}

void kmain(void)
{
  char *str = "Yo, fo shizzle";

  // clear the text view
  clear();

  // write the text
  write(str, 0);

  return;
}
