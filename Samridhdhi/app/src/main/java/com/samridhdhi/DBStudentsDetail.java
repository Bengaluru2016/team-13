package com.samridhdhi;

/**
 * Created by Randhir on 1/30/2015.
 */

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;
import java.util.List;

public class DBStudentsDetail {

    public static final String KEY_ID = "id";
    public static final String KEY_STUDENT_NAME = "name";
    public static final String KEY_STUDENT_DOB = "dob";
    public static final String KEY_STUDENT_FATHER = "father";
    public static final String KEY_STUDENT_MOTHER = "mother";
    public static final String KEY_STUDENT_GENDER = "gender";
    public static final String KEY_STUDENT_ADDITIONAL = "additional";
    public static final String KEY_DATE_ENROLLED = "date";


    private static final String DATABASE_NAME = "StudentDetails";
    public static final String DATABASE_TABLE = "studentt_details";
    private static final int DATABASE_VERSION = 1;

    private DBHelper ourHelper;
    private final Context ourContext;
    public SQLiteDatabase ourDatabase;

    public void clearData() {
        ourDatabase.execSQL("delete from student details");
    }


    private static class DBHelper extends SQLiteOpenHelper {

        public DBHelper(Context context) {
            super(context, DBStudentsDetail.DATABASE_NAME, null,
                    DBStudentsDetail.DATABASE_VERSION);
        }

        @Override
        public void onCreate(SQLiteDatabase db) {
            db.execSQL("CREATE TABLE " + DBStudentsDetail.DATABASE_TABLE + " ("
                    + DBStudentsDetail.KEY_ID + " PRIMARY KEY, "
                    + DBStudentsDetail.KEY_STUDENT_NAME + " TEXT NOT NULL, "
                    + DBStudentsDetail.KEY_STUDENT_DOB + " TEXT NOT NULL, "
                    + DBStudentsDetail.KEY_STUDENT_FATHER + " TEXT NOT NULL, "
                    + DBStudentsDetail.KEY_STUDENT_MOTHER + " TEXT NOT NULL, "
                    + DBStudentsDetail.KEY_STUDENT_GENDER + " TEXT NOT NULL, "
                    + DBStudentsDetail.KEY_DATE_ENROLLED + " DATE, "
                    + DBStudentsDetail.KEY_STUDENT_ADDITIONAL + " TEXT NOT NULL);");
        }

        @Override
        public void onUpgrade(SQLiteDatabase db, int arg1, int arg2) {
            db.execSQL("DROP TABLE IF EXIST " + DATABASE_TABLE);
            onCreate(db);
        }
    }

    public DBStudentsDetail(Context c) {
        ourContext = c;
    }

    public DBStudentsDetail open() throws SQLException {
        ourHelper = new DBHelper(ourContext);
        ourDatabase = ourHelper.getWritableDatabase();
        return this;
    }

    public void close() {
        ourHelper.close();
    }

    public long createEntry(String id, String name,
                            String dob, String father, String mother, String gender,
                            String additional) {
        ContentValues cv = new ContentValues();
        cv.put(KEY_ID, id);
        cv.put(KEY_STUDENT_NAME, name);
        cv.put(KEY_STUDENT_DOB, dob);
        cv.put(KEY_STUDENT_FATHER, father);
        cv.put(KEY_STUDENT_MOTHER, mother);
        cv.put(KEY_STUDENT_GENDER, gender);
        cv.put(KEY_STUDENT_ADDITIONAL, additional);
        return ourDatabase.insert(DATABASE_TABLE, null, cv);
    }

    public String[] getSingleEvent(String eventId) {
        //String name, cordinator, rules, timing, fee, cash;
        String[] result = new String[6];
        Cursor mCursor = ourDatabase.rawQuery("SELECT * FROM "
                + DBStudentsDetail.DATABASE_TABLE + " WHERE " + KEY_ID + " = \"" + eventId + "\"", null);

        if (mCursor.moveToFirst()) {
            result[0] = mCursor.getString(mCursor
                    .getColumnIndex(DBStudentsDetail.KEY_STUDENT_NAME));
            result[1] = mCursor.getString(mCursor
                    .getColumnIndex(DBStudentsDetail.KEY_STUDENT_DOB));

            result[2] = mCursor.getString(mCursor
                    .getColumnIndex(DBStudentsDetail.KEY_STUDENT_MOTHER));
            result[3] = mCursor.getString(mCursor
                    .getColumnIndex(DBStudentsDetail.KEY_STUDENT_GENDER));
            result[4] = mCursor.getString(mCursor
                    .getColumnIndex(DBStudentsDetail.KEY_STUDENT_ADDITIONAL));

            mCursor.close();
            return result;
        } else {
            return null;
        }

    }

    public void getStudents(String category, List<Student> data) {

        String id, name, gender, dob, father, mother, additional, date;
        Cursor mCursor = ourDatabase.rawQuery("SELECT * FROM "
                + DBStudentsDetail.DATABASE_TABLE + " WHERE " + KEY_STUDENT_FATHER + " = \"" + category + "\"", null);
        data.clear();

        if (mCursor.moveToFirst()) {

            do {

                id = mCursor.getString(mCursor
                        .getColumnIndex(DBStudentsDetail.KEY_ID));
                name = mCursor.getString(mCursor
                        .getColumnIndex(DBStudentsDetail.KEY_STUDENT_NAME));
                dob = mCursor.getString(mCursor
                        .getColumnIndex(DBStudentsDetail.KEY_STUDENT_DOB));
                gender = mCursor.getString(mCursor
                        .getColumnIndex(DBStudentsDetail.KEY_STUDENT_GENDER));
                father = mCursor.getString(mCursor
                        .getColumnIndex(DBStudentsDetail.KEY_STUDENT_FATHER));
                mother = mCursor.getString(mCursor
                        .getColumnIndex(DBStudentsDetail.KEY_STUDENT_MOTHER));
                additional = mCursor.getString(mCursor
                        .getColumnIndex(DBStudentsDetail.KEY_STUDENT_ADDITIONAL));
                date = mCursor.getString(mCursor
                        .getColumnIndex(DBStudentsDetail.KEY_DATE_ENROLLED));

                data.add(0, new Student(0,name,dob,gender,father,mother,additional));

            } while (mCursor.moveToNext());
        }

        mCursor.close();

    }
}

