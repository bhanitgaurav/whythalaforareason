class ThalaForAReasonUtils {

  static List<String> findTheReason(String value) {
    List<String> thalaForAReasons = [];

    var intValue = int.tryParse(value);
    if (intValue != null) {
      if (intValue == 7) thalaForAReasons.add('The given number is 7.');

      final sumOfDigits = sumOfDigit(intValue);
      if (intValue != 7 && sumOfDigits['sum'] == 7) {
        thalaForAReasons.add('${sumOfDigits['sumDetail']} is 7.');
      }

      if (intValue == 111) thalaForAReasons.add('$value is binary of 7.');

      if (intValue != 0 && intValue % 7 == 0) {
        thalaForAReasons.add('$intValue is factor of 7.');
      }
    }

    final name = value.toString().toLowerCase();

    if (name == 'thala' ||
        name == 'msd' ||
        name == 'dhoni' ||
        name == 'mahendra singh dhoni') {
      thalaForAReasons.add('"$value" word used for Mahendra Singh Dhoni.');
    }

    if (name == 'turms') {
      thalaForAReasons.add(
          'Mahendra Singh Dhoni was spotted 22 times in a month wearing shirts from this clothing brand.');
    }

    if (name == 'voilet') {
      thalaForAReasons.add('Voilet is the 7th color of rainbow.');
    }
    if (name == 'saturday') {
      thalaForAReasons.add('Saturday is the 7th day of week.');
    }
    if (name == 'july') {
      thalaForAReasons.add('July is the 7th month in the Gregorian Calendar.');
    }
    if (name == 'vii') {
      thalaForAReasons.add('VII is 7 in roman number system.');
    }
    if (name == 'antartica') {
      thalaForAReasons.add('Antartica is 7th continent in the world.');
    }
    if (name == 'sloth') {
      thalaForAReasons.add('Sloth is 7th deadly sins.');
    }
    if (name == 'doc') {
      thalaForAReasons
          .add('Doc is the leader of the 7 dwarfs in snow white fairy tale.');
    }

    if (name == 'the great pyramid of giza' ||
        name == 'great pyramid of giza') {
      thalaForAReasons.add(
          '"The great pyramid of giza" is the oldest and last remaining of the original 7th world wonders');
    }
    if (name == 'harry potter and the deathly hallows') {
      thalaForAReasons.add(
          '"Harry Potter and the Deathly Hallows" is the 7th and final book in the Harry Potter series.');
    }
    if (name == 'libra') {
      thalaForAReasons.add('Libra is 7th zodiac sign.');
    }
    if (name == 'andrew jackson') {
      thalaForAReasons.add(
          'Andrew Jackson, 7th President of the United States, serving from 1829 to 1837.');
    }

    if (name == 'giani zail singh' || name == 'zail singh') {
      thalaForAReasons.add(
          'Giani Zail Singh was an Indian politician from Punjab who served as the seventh president of India from 1982 to 1987.');
    }
    if (name == 'vishwanath pratap singh') {
      thalaForAReasons.add(
          'Vishwanath Pratap Singh was an Indian politician who was the 7th Prime Minister of India from 1989 to 1990.');
    }

    if (name == 'enceladus') {
      thalaForAReasons.add('Enceladus is the seventh moon of Saturn.');
    }
    if (name == 'tajmahal' || name == 'taj mahal') {
      thalaForAReasons.add('The Taj Mahal is 7th wonder of the world.');
    }

    if (name == 'sports fit' ||
        name == '7inkbrews' ||
        name == 'chennaiyin' ||
        name == 'theseven' ||
        name == 'the seven' ||
        name == 'khatabook') {
      thalaForAReasons.add('Mahendra Singh Dhoni has invested in $name.');
    }

    if (name == 'nitrogen') {
      thalaForAReasons
          .add('Nitrogen is the 7th element in the periodic table.');
    }
    if (name == 'technetium') {
      thalaForAReasons.add(
          'Technetium (atomic number is 43 in the periodic table) 4+3 = 7.');
    }
    if (name == 'ti') {
      thalaForAReasons.add(
          'The 7th note is denoted as "Ti" in solfège in a diatonic scale.');
    }

    if (containsOnlyLetters(value) && value.length == 7) {
      thalaForAReasons.add('The $value has 7 letters.');
    }

    final sumOfAlphabetPosition = sumOfAlphabetPositions(value);
    final sumOfLetterPosition = sumOfAlphabetPosition['sum'];
    if (sumOfLetterPosition == 7) {
      final details = sumOfAlphabetPosition['sumDetail'];
      thalaForAReasons
          .add('The $value is in alphabet is $details, whose sum is 7.');
    }

    if (sumOfLetterPosition != 0 && sumOfLetterPosition % 7 == 0) {
      final details = sumOfAlphabetPosition['sumDetail'];
      thalaForAReasons.add(
          'The $value is in alphabet is $details = $sumOfLetterPosition which is factor of 7.');
    }

    final sumOfAsciiValue = _sumOfAsciiValue(value);
    final asciiSum = sumOfAsciiValue['sum'];
    final asciiDetails = sumOfAsciiValue['sumDetail'];

    if (asciiSum == 7) {
      thalaForAReasons.add('The sum of $value in ASCII is 7.');
    }

    if (asciiSum != 0 && asciiSum % 7 == 0) {
      thalaForAReasons.add(
          'The sum of $value in ASCII is $asciiDetails = $asciiSum which is factor of 7.');
    }
    return thalaForAReasons;
  }

  static bool containsOnlyLetters(String input) {
    // Use a regular expression to check if the string contains only letters
    return RegExp(r'^[a-zA-Z]+$').hasMatch(input);
  }

  static Map<String, dynamic> _sumOfAsciiValue(String value) {
    var sum = 0;
    String sumDetail = '';
    for (int i = 0; i < value.length; i++) {
      int asciiValue = value.codeUnitAt(i);
      // print("ASCII value of ${value[i]} is $asciiValue");
      sumDetail += (i == 0) ? '$asciiValue' : ' + $asciiValue';
      sum += asciiValue;
    }
    return {'sum': sum, 'sumDetail': sumDetail};
  }

  static Map<String, dynamic> sumOfAlphabetPositions(String input) {
    int sum = 0;
    String sumDetail = '';
    for (int i = 0; i < input.length; i++) {
      // Convert the character to lowercase
      String charLowerCase = input[i].toLowerCase();
      // Check if the character is a lowercase letter
      if (charLowerCase.codeUnitAt(0) >= 'a'.codeUnitAt(0) &&
          charLowerCase.codeUnitAt(0) <= 'z'.codeUnitAt(0)) {
        // Calculate the position in the alphabet (a=1, b=2, ..., z=26)
        int position = charLowerCase.codeUnitAt(0) - 'a'.codeUnitAt(0) + 1;

        sumDetail += (i == 0) ? '$position' : ' + $position';
        sum += position;
      } else {
        return {'sum': sum, 'sumDetail': sumDetail};
      }
    }

    return {'sum': sum, 'sumDetail': sumDetail};
  }

  static Map<String, dynamic> sumOfDigit(int input) {
    // Convert the integer to a string to iterate through its digits
    String inputString = input.toString();
    // Initialize the sum
    int sum = 0;
    String sumDetail = '';

    // Iterate through each digit in the string
    for (int i = 0; i < inputString.length; i++) {
      // Parse the digit as an integer
      int digit = int.parse(inputString[i]);

      // Update sumDetail
      sumDetail += (i == 0) ? '$digit' : ' + $digit';

      sum += digit;
    }

    // Return the final sum and sumDetail as a Map
    return {'sum': sum, 'sumDetail': sumDetail};
  }
}
