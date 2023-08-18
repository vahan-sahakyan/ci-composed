const os = require("os");
const WebSocket = require("ws");
const { KafkaClient, Consumer } = require("kafka-node");

const LOCAL_IP = (function () {
  const interfaces = os.networkInterfaces();
  for (const interfaceName in interfaces) {
    const interfaceInfo = interfaces[interfaceName];
    for (const info of interfaceInfo) {
      if (!info.internal && info.family === "IPv4") {
        return info.address;
      }
    }
  }
  return "localhost";
})();

const WS_PORT = process.env.WS_ENV_WS_PORT || 7078;
const HOSTNAME = process.env.WS_ENV_KAFKA_HOSTNAME || LOCAL_IP;

const server = new WebSocket.Server({ port: WS_PORT });

const kafkaClient = new KafkaClient({
  kafkaHost: `${HOSTNAME}:9092`,
  clientId: "ci-kafka-consumer",
});

const consumer = new Consumer(kafkaClient, [{ topic: "db-changes" }], {
  fromOffset: false,
});

console.log(`WebSocket Serving on Port: ${WS_PORT}`);
server.on("connection", (socket) => {
  console.log("NEW CONNECTION");
  consumer.on("message", (message) => {
    socket.send(JSON.stringify(message));
  });
});
