int ack(int m, int n) {
  if(!m) return n + 1;
  if(!n) return ack(m - 1, 1);
  return ack(m - 1, ack(m, n - 1));
}
