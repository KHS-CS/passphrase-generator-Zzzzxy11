String[] words = new String[66667];
String phrase = "";

void setup() {
  size(1000, 800);
  background(240);
  textSize(48);
  textAlign(CENTER, CENTER);

  String[] lines = loadStrings("eff_large_wordlist.txt");
  for (int i = 0; i < lines.length; i++) {
    String[] parts = split(lines[i], '\t');
    if (parts.length == 2) {
      int key = int(parts[0]);
      words[key] = parts[1];
    }
  }
}

void keyPressed() {
  if (key == ' ') { 
    phrase += generateWord() + " ";
  } else if (key == BACKSPACE && phrase.length() > 0) {
    phrase = phrase.substring(0, phrase.length() - 1);
  } else if (key == ENTER || key == RETURN) {
    phrase = "";
  }
}

String generateWord() {
  String lookup = "";
  for (int i = 0; i < 5; i++) {
    lookup += str(int(random(1, 7))); 
  }
  return words[int(lookup)];
}

void draw() {
  background(240);
  fill(50);
  text(phrase, width / 2, height / 2);
}
