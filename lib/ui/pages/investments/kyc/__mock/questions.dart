import 'dart:convert';

import 'package:ovo/ui/pages/investments/kyc/models/answer/answer.dart';
import 'package:ovo/ui/pages/investments/kyc/models/question/question.dart';

final mockquestionnaire = jsonEncode([
  Question(
      id: 'q1',
      question:
          'I would enjoy exploring investment opportunities for my money.',
      answers: [
        Answer(id: 'a11', text: 'I strongly agree'),
        Answer(id: 'a12', text: 'I tend to agree'),
        Answer(id: 'a13', text: 'In between'),
        Answer(id: 'a14', text: 'I tend to disagree'),
        Answer(id: 'a15', text: 'I strongly disagree'),
      ]),
  Question(
      id: 'q2',
      question:
          'I would go for the best possible return even if there were risk involved.',
      answers: [
        Answer(id: 'a21', text: 'Always'),
        Answer(id: 'a22', text: 'Usually'),
        Answer(id: 'a23', text: 'Sometimes'),
        Answer(id: 'a24', text: 'Rarely'),
        Answer(id: 'a25', text: 'Never')
      ]),
  Question(
    id: 'q3',
    question:
        'How would you describe your typical attitude when making important financial decisions?',
    answers: [
      Answer(id: 'a31', text: 'Very adventurous'),
      Answer(id: 'a32', text: 'Fairly adventurous'),
      Answer(id: 'a33', text: 'Average'),
      Answer(id: 'a34', text: 'Fairly cautious'),
      Answer(id: 'a35', text: 'Very cautious')
    ],
  ),
  Question(
    id: 'q4',
    question:
        'What amount of risk do you feel you have taken with your past financial decisions?',
    answers: [
      Answer(id: 'a41', text: 'Very Large'),
      Answer(id: 'a42', text: 'Large'),
      Answer(id: 'a43', text: 'Medium'),
      Answer(id: 'a44', text: 'Small'),
      Answer(id: 'a45', text: 'Very small')
    ],
  ),
  Question(
    id: 'q5',
    question:
        'To reach my financial goal I prefer an investment which is safe and grows slowly but steadily, even if it means lower growth overall.',
    answers: [
      Answer(id: 'a51', text: 'I strongly agree with this statement'),
      Answer(id: 'a52', text: 'I tend to agree with this statement'),
      Answer(id: 'a53', text: 'In between'),
      Answer(id: 'a54', text: 'I tend to disagree with this statement'),
      Answer(id: 'a55', text: 'I strongly disagree with this statement')
    ],
  ),
  Question(
    id: 'q6',
    question:
        'I am looking for high investment growth. I am willing to accept the possibility of greater losses to achieve this.',
    answers: [
      Answer(id: 'a61', text: 'I strongly agree with this statement'),
      Answer(id: 'a62', text: 'I tend to agree with this statement'),
      Answer(id: 'a63', text: 'In between'),
      Answer(id: 'a64', text: 'I tend to disagree with this statement'),
      Answer(id: 'a65', text: 'I strongly disagree with this statement')
    ],
  ),
  Question(
    id: 'q7',
    question:
        'If you had money to invest, how much would you be willing to place in an investment with possible high returns but a similar chance of losing some of your money?',
    answers: [
      Answer(id: 'a71', text: 'All of it'),
      Answer(id: 'a72', text: 'More than half'),
      Answer(id: 'a73', text: 'Half'),
      Answer(id: 'a74', text: 'Less than half'),
      Answer(id: 'a75', text: 'Very little, if any')
    ],
  ),
  Question(
    id: 'q8',
    question:
        'How do you think that a friend who knows you well would describe your attitude to taking financial risks?',
    answers: [
      Answer(id: 'a81', text: 'Daring'),
      Answer(id: 'a82', text: 'Sometimes daring'),
      Answer(id: 'a83', text: 'A thoughtful risk taker'),
      Answer(id: 'a84', text: 'Careful'),
      Answer(id: 'a85', text: 'Very cautious and risk averse')
    ],
  ),
  Question(
    id: 'q9',
    question:
        'If you had picked an investment with potential for large gains but also the risk of large losses how would you feel:',
    answers: [
      Answer(id: 'a91', text: 'Panicked and very uncomfortable'),
      Answer(id: 'a92', text: 'Quite uneasy'),
      Answer(id: 'a93', text: 'A little concerned'),
      Answer(id: 'a94', text: 'Accepting of the possible highs and lows'),
      Answer(id: 'a95', text: 'Excited by the potential for gain'),
    ],
  ),
  Question(
    id: 'q10',
    question:
        'Imagine that you have some money to invest and a choice of two investment products, which option would you choose?',
    answers: [
      Answer(
          id: 'a101',
          text:
              'A product with a low average annual return but almost no risk of loss of the initial investment'),
      Answer(id: 'a91', text: 'A mixture of the two products'),
      Answer(
          id: 'a102',
          text:
              'A product with a higher average annual return but some risk of losing part of the initial investment'),
    ],
  ),
  Question(
      id: 'q11',
      question: 'I would prefer small certain gains to large uncertain ones.',
      answers: [
        Answer(id: 'a111', text: 'I strongly agree'),
        Answer(id: 'a112', text: 'I tend to agree'),
        Answer(id: 'a113', text: 'In between'),
        Answer(id: 'a114', text: 'I tend to disagree'),
        Answer(id: 'a115', text: 'I strongly disagree')
      ]),
  Question(
      id: 'q12',
      question:
          'When considering a major financial decision, which statement BEST describes the way you think about the possible losses or the possible gains?',
      answers: [
        Answer(id: 'a121', text: 'I am excited about the possible gains'),
        Answer(id: 'a122', text: 'I am optimistic about possible gains'),
        Answer(
            id: 'a123',
            text: 'I think about both the possible gains and losses'),
        Answer(id: 'a124', text: 'I am conscious of the possible losses'),
        Answer(id: 'a125', text: 'I worry about the possible losses')
      ]),
  Question(
      id: 'q13',
      question:
          'I want my investment money to be safe even if it means lower returns.',
      answers: [
        Answer(id: 'a131', text: 'I strongly agree'),
        Answer(id: 'a132', text: 'I tend to agree'),
        Answer(id: 'a134', text: 'In between'),
        Answer(id: 'a135', text: 'I tend to disagree'),
        Answer(id: 'a136', text: 'I strongly disagree')
      ]),
]);
