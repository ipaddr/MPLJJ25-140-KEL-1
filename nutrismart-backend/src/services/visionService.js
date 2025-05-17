const vision = require('@google-cloud/vision');
const client = new vision.ImageAnnotatorClient();

class VisionService {
  // Deteksi wajah dalam gambar
  static async detectFace(image) {
    try {
      const [result] = await client.faceDetection(image);  // image bisa berupa URL atau base64 string
      const faces = result.faceAnnotations;

      if (faces.length === 0) {
        return { success: false, message: 'Tidak ada wajah yang terdeteksi' };
      }

      // Bisa mengembalikan informasi wajah yang terdeteksi jika dibutuhkan
      return { success: true, faces };
    } catch (error) {
      console.error('Error detecting face:', error);
      return { success: false, message: 'Terjadi kesalahan saat mendeteksi wajah' };
    }
  }
}

module.exports = VisionService;
