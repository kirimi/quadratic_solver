import 'package:quadratic_solver/quadratic_solver.dart';
import 'package:test/test.dart';

void main() {
  test(
    'для уравнения x^2+1 = 0 корней нет',
    () => expect(solve(1, 0, 1), []),
  );

  test(
    'для уравнения x^2-1 = 0 есть два корня кратности 1 (x1=1, x2=-1)',
    () => expect(solve(1, 0, -1), [1, -1]),
  );

  test(
    'для уравнения 2x^2+7x+3 = 0 есть два корня (x1=-0.5, x2=-3)',
    () => expect(solve(2, 7, 3), [-.5, -3]),
  );

  test(
    'для уравнения x^2+2x+1 = 0 есть один корень кратности 2 (x1= x2 = -1).',
    () => expect(solve(1, 2, 1), [-1, -1]),
  );

  test(
    'коэффициент a не может быть равен 0',
    () => expect(() => solve(0, 2, 1), throwsFormatException),
  );

  test(
    'коэффициент a не может быть равен 0, с учетом epsilon',
    () => expect(() => solve(.00000000000000001, 2, 1), throwsFormatException),
  );

  test(
    'дискриминант равен 0, с учетом epsilon',
    () {
      // уравнение имеет один корень, с учетом epsilon
      final result = solve(1, 2, 1.00000000000000001);
      expect(result[0], result[1]);
    },
  );

  test(
    'коэфициенты не равны double.infinity',
    () => expect(() => solve(1, double.infinity, 1), throwsFormatException),
  );

  test(
    'коэфициенты не равны double.nan',
    () => expect(() => solve(1, double.nan, 1), throwsFormatException),
  );
}
