# Navigator Inherited Example

- `Navigator.push`로 띄운 route에서 `InheritedWidget`에 접근할 수 없는 문제를 해결하기 위해 문제를 재현하고 해결 방법을 도출하여 실제로 구현해 보았다.
- [관련글](https://velog.io/@cskime/Navigator.push%EB%A1%9C-%EB%9D%84%EC%9A%B4-route%EC%97%90%EC%84%9C-InheritedWidget%EC%97%90-%EC%A0%91%EA%B7%BC%ED%95%A0-%EC%88%98-%EC%97%86%EB%8A%94-%EB%AC%B8%EC%A0%9C)

## Summary

- `MaterialApp`은 내부에서 routing을 담당하는 최상위 `Navigator`를 만들고 widget tree에 추가한다.
- `Navigator.of(context)`는 현재 widget의 widget tree에서 가장 가까운 ancestor `Navigator` widget을 얻는다.
- `build()` method로 전달되는 `BuildContext`를 통해 `Navigator.of(context)`를 얻으면 `MaterialApp` 아래에 있는 최상위 `Navigator`를 얻는다.
- Screen A에서 Screen B로 `Navigator.push`를 통해 화면을 전환하면, Screen A와 B는 같은 level로 widget tree에 추가된다. (sibling 관계)
- 이 때, Screen B가 A의 child widget으로 만들려면 Screen A가 자신이 직접 관리하는 `Navigator`를 가지고 routing 해야 한다. 따라서, Screen A widget이 내부에서 `Navigator` widget을 별도로 생성하고, `MaterialPageRoute`의 `builder` 함수로 Screen A의 UI를 구성하는 widget을 반환한다.
- `Navigator`를 추가하지 않으면서 Screen B가 Screen A와 `InheritedWidget`을 통한 shared state에 접근하려면, `InheritedWidget`이 `MaterialApp`보다 상위에 있어야 한다.
  - 실제로 Riverpod package의 `ProviderScope`는 `MyApp`을 감싸는 widget tree의 root로 추가해야 하는데,
  - `ProviderScope`는 내부 `build()` method에서 `InheritedWidget`을 상속받는 `UncontrolledProviderScope`를 반환한다.
  - Riverpod도 비슷한 문제를 해결하기 위해 최상위에 `InheritedWidget`을 놓으려는 시도를 한 것 같다.
