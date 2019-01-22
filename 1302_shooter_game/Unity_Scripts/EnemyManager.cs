using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class EnemyManager : MonoBehaviour
{

    private List<EnemyBase> eList = new List<EnemyBase>();
    private List<PowerupCollect2> wList = new List<PowerupCollect2>();
    System.Random rd;
    private Vector3 randTransform;
    public EnemyBase[] eBase;
    public PowerupCollect2[] wBase;
    public int NumEnemies;


    // Use this for initialization
    void Start()
    {
        rd = new System.Random();
        //eList = new List<EnemyBase>();
        //enemyCreateArr = new int[NumEnemies];




        //for (int i = 0; i < enemyCreateArr.Length; i++)
        //{
        //    enemyCreateArr[i] = rd.Next(1, 3);
        //    Debug.Log(enemyCreateArr[i]);
        //}

        for (int d = 0; d < NumEnemies; d++)
        {
            //Debug.Log(d);
            int i = rd.Next(1, 4);
            Debug.Log(i);
            switch (i)
            {
                case 1:
                    eList.Add(Instantiate(eBase[0], transform.position, transform.rotation));
                    Debug.Log(0);

                    break;
                case 2:
                    eList.Add(Instantiate(eBase[1], transform.position, transform.rotation));
                    Debug.Log(1);

                    break;
                case 3:
                    eList.Add(Instantiate(eBase[2], transform.position, transform.rotation));
                    Debug.Log(2);

                    break;
            }
            eList[d].transform.position = new Vector3(rd.Next(-80, 70), .5f, rd.Next(-80, 30));
        }

        //Weapons
        for (int i = 0; i < 3; i++)
        {
            wList.Add(Instantiate(wBase[i], transform.position, transform.rotation));
            wList[i].transform.position = new Vector3(rd.Next(-80, 70), 1f, rd.Next(-80, 30));
        }
    }

    // Update is called once per frame
    void Update()
    {
        foreach (EnemyBase eb in eList)
        {
            if (eb != null)
            {
                eb.move();
                eb.checkForAttack();
            }
        }
    }
}
