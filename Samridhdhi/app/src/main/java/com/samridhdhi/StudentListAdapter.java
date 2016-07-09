package com.samridhdhi;

/**
 * Created by Randhir on 2/6/2015.
 */

import android.content.Context;
import android.net.Uri;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;


import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by Randhir on 1/29/2015.
 */
public class StudentListAdapter extends RecyclerView.Adapter<StudentListAdapter.MyViewHolder> {

    private LayoutInflater inflater;
    List<Student> data = new ArrayList<>();
    Context c;
    Random rand = new Random();

    public StudentListAdapter(Context context, List<Student> data) {
        c = context;
        inflater = LayoutInflater.from(context);
        this.data = data;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = inflater.inflate(R.layout.student_list_element, parent, false);
        MyViewHolder holder = new MyViewHolder(view);
        return holder;
    }

    @Override
    public void onBindViewHolder(MyViewHolder holder, int position) {
        Student current = data.get(position);
        holder.image.setImageResource(R.drawable.kidoblivion);

//        try {
//            String uriStr = current.id;
//            Uri uri = Uri.parse(uriStr);
//            holder.image.setImageURI(uri);
//        } catch (Exception e) {
//        }
        holder.name.setText(current.name);
    }

    @Override
    public int getItemCount() {
        return data.size();
    }

    class MyViewHolder extends RecyclerView.ViewHolder {

        ImageView image;
        TextView name;

        public MyViewHolder(View itemView) {
            super(itemView);
            image = (ImageView) itemView.findViewById(R.id.student_image);
            name = (TextView) itemView.findViewById(R.id.student_name);

        }
    }

}
