String[] words = new String[66667];
String phrase = "";
ArrayList<String> saved = new ArrayList<String>();

void setup() {
  size(1000, 800);
  textSize(28);
  textAlign(LEFT, TOP);
  String[] lines = loadStrings("eff_large_wordlist.txt");
  for (int i = 0; i < lines.length; i++) {
    String[] parts = split(lines[i], '\t');
    if (parts.length == 2) words[int(parts[0])] = parts[1];
  }
}

void keyPressed() {
  if (key == ' ') phrase += generateWord() + " ";
  else if (key == 'r' || key == 'R') {
    if (phrase.trim().length() > 0) saved.add(phrase.trim());
  } 
  else if (key == 's' || key == 'S') {
    if (saved.size() > 0) {
      String[] out = new String[saved.size()];
      for (int i = 0; i < saved.size(); i++) out[i] = saved.get(i);
      saveStrings("saved_passwords.txt", out);
    }
  }
  else if (key == ENTER || key == RETURN) phrase = "";
}

String generateWord() {
  String lookup = "";
  for (int i = 0; i < 5; i++) lookup += str(int(random(1, 7)));
  return words[int(lookup)];
}

void draw() {
  background(245);
  fill(0);
  text("SPACE: new  |  R: record  |  S: save  |  ENTER: clear", 30, 30);
  text("Current:", 30, 90);
  fill(0);
  text(phrase, 180, 90, width - 200, 200);
  text("Recorded:", 30, 340);
  fill(50);
  int y = 380;
  for (int i = saved.size() - 1; i >= 0 && y < height - 30; i--) {
    text(saved.get(i), 60, y, width - 100, 200);
    y += 32;
  }
}
