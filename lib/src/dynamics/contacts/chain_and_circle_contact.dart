part of box2d;

class ChainAndCircleContact extends Contact {
  ChainAndCircleContact(IWorldPool argPool) : super(argPool);

  void init(Fixture fA, int indexA, Fixture fB, int indexB) {
    super.init(fA, indexA, fB, indexB);
    assert(_fixtureA.getType() == ShapeType.CHAIN);
    assert(_fixtureB.getType() == ShapeType.CIRCLE);
  }

  final EdgeShape _edge = EdgeShape();

  void evaluate(Manifold manifold, Transform xfA, Transform xfB) {
    final chain = _fixtureA.getShape() as ChainShape;
    chain.getChildEdge(_edge, _indexA);
    _pool.getCollision().collideEdgeAndCircle(
        manifold, _edge, xfA, _fixtureB.getShape() as CircleShape, xfB);
  }
}
