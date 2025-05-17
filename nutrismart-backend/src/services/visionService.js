const vision = require('@google-cloud/vision');
const client = new vision.ImageAnnotatorClient();

class VisionService {
  static async detectFace(image) {
    try {
      const [result] = await client.faceDetection(image);
      const faces = result.faceAnnotations;
      return { success: true, faces };
    } catch (error) {
      console.error('Error detecting faces:', error);
      return { success: false, error: error.message };
    }
  }
}

module.exports = VisionService;
