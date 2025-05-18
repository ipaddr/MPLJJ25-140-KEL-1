const { storage } = require('../config/firebase');

class StorageService {
  static async uploadFile(fileBuffer, fileName) {
    try {
      const bucket = storage.bucket();
      const file = bucket.file(fileName);

      await file.save(fileBuffer);
      await file.makePublic(); // Membuat file bisa diakses publik

      return { success: true, fileUrl: file.publicUrl() };
    } catch (error) {
      console.error('Error uploading file:', error);
      return { success: false, error: error.message };
    }
  }

  static async deleteFile(fileName) {
    try {
      const bucket = storage.bucket();
      const file = bucket.file(fileName);

      await file.delete();
      return { success: true };
    } catch (error) {
      console.error('Error deleting file:', error);
      return { success: false, error: error.message };
    }
  }
}

module.exports = StorageService;
